<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use App\Category;
use App\Product;
use App\ProductsAttribute;
use Image;
use File;
use Illuminate\Support\Facades\Input;
class ProductsController extends Controller
{
    public function addProduct(Request $request){
    	if($request->isMethod('post')){
    		$data = $request->all();
    		if(empty($data['category_id'])){
    			return redirect()->back()->with('flash_message_error','Under Category is missing!');
    		}
    		$product = new Product;
    		$product->category_id = $data['category_id'];
    		$product->product_name = $data['product_name'];
    		$product->product_code = $data['product_code'];
    		$product->product_color = $data['product_color'];
    		if(!empty($data['description'])){
    			$product->description = $data['description'];	
    		}else{
    			$product->description = '';
    		}
    		$product->price = $data['price'];
    		// Upload image
    		if($request->hasFile('image')){
    			$image_tmp = Input::file('image');
    			if($image_tmp->isValid()){
    				$extension = $image_tmp->getClientOriginalExtension();
    				$filename = rand(111,99999).'.'.$extension;
    				$large_image_path = 'backend/images/products/large/'.$filename;
    				$medium_image_path = 'backend/images/products/medium/'.$filename;
    				$small_image_path = 'backend/images/products/small/'.$filename;
    				// Resize image
    				Image::make($image_tmp)->save($large_image_path);
    				Image::make($image_tmp)->resize(600,600)->save($medium_image_path);
    				Image::make($image_tmp)->resize(300,300)->save($small_image_path);
    				//Store image name in products table
    				$product->image = $filename;
    			}

    		}
    		$product->save();
    		return redirect()->back()->with('flash_message_success','Product has been added successfully!');
    	}
    	//Categories dropdown start
    	$categories = Category::where(['parent_id'=>0])->get();
    	$categories_dropdown = "<option selected disabled>Select</option>";
    	foreach($categories as $cat){
    		$categories_dropdown .="<option value='".$cat->id."'>".$cat->name."</option>";
    		$sub_categories = Category::where(['parent_id'=>$cat->id])->get();
    		foreach($sub_categories as $sub_cat){
    			$categories_dropdown .="<option value='".$sub_cat->id."'>&nbsp;--&nbsp;".$sub_cat->name."</option>";
    		}
    	}
    	//Categories dropdown end
    	return view('admin.products.add_product')->with(compact('categories_dropdown'));
    }
    public function editProduct(Request $request, $id = null){
    	if($request->isMethod('post')){
    		$data = $request->all();
    		// echo "<pre>"; print_r($data); die;

    			// Upload image
    		if($request->hasFile('image')){
    			$image_tmp = Input::file('image');
    			if($image_tmp->isValid()){
    				$extension = $image_tmp->getClientOriginalExtension();
    				$filename = rand(111,99999).'.'.$extension;
    				$large_image_path = 'backend/images/products/large/'.$filename;
    				$medium_image_path = 'backend/images/products/medium/'.$filename;
    				$small_image_path = 'backend/images/products/small/'.$filename;
    				// Resize image
    				Image::make($image_tmp)->save($large_image_path);
    				Image::make($image_tmp)->resize(600,600)->save($medium_image_path);
    				Image::make($image_tmp)->resize(300,300)->save($small_image_path);
    				//Store image name in products table
    			}
    		}else{
    			$filename = $data['current_image'];
    		}

    		if(empty($data['description'])){
    			$data['description'] = '';
    		}

    		Product::where(['id'=>$id])->update(['category_id'=>$data['category_id'],
    			'product_name'=>$data['product_name'],'product_code'=>$data['product_code'],'product_color'=>$data['product_color'],'description'=>$data['description'],'price'=>$data['price'],'image'=>$filename]);
    		return redirect()->back()->with('flash_message_success','Product has been updated successfully!');
    	}
    	//Get product details
    	$productDetails = Product::where(['id'=>$id])->first();
    	//Categories dropdown start
    	$categories = Category::where(['parent_id'=>0])->get();
    	$categories_dropdown = "<option selected disabled>Select</option>";
    	foreach($categories as $cat){
    		if($cat->id==$productDetails->category_id){
    			$selected = "selected";
    		}else{
    			$selected = "";
    		}
    		$categories_dropdown .="<option value='".$cat->id."' ".$selected.">".$cat->name."</option>";
    		$sub_categories = Category::where(['parent_id'=>$cat->id])->get();
    		foreach($sub_categories as $sub_cat){
    			if($sub_cat->id==$productDetails->category_id){
    			$selected = "selected";
    		}else{
    			$selected = "";
    		}
    			$categories_dropdown .="<option value='".$sub_cat->id."' ".$selected.">&nbsp;--&nbsp;".$sub_cat->name."</option>";
    		}
    	}
    	//Categories dropdown end
    	return view('admin.products.edit_product')->with(compact('productDetails','categories_dropdown'));
    } 
    public function viewProducts()
    {
    	$products = Product::get();
        $products = json_decode(json_encode($products));
            foreach($products as $key=>$val){
                $category_name = Category::where(['id'=>$val->category_id])->first();
                $products[$key]->category_name = $category_name->name;
            }
        return view('admin.products.view_products')->with(compact('products'));
    }
    public function deleteProduct($id=null){

        $pImages = Product::where(['id'=>$id])->first();

        $file = $pImages->image;

        $file1 = public_path().'/backend/images/products/small/'.$file;
        $file2 = public_path().'/backend/images/products/medium/'.$file;
        $file3 = public_path().'/backend/images/products/large/'.$file;
        
        $filename = array($file1, $file2, $file3);
        $exists = false;
        
        foreach ($filename as $file) {
            if (file_exists($file)) {
                $exists = true;
            }
        }
        if ($exists == true) {
            foreach($filename as $file) {
                unlink($file);
            }
        Product::where(['id'=>$id])->delete();
        return redirect()->back()->with('flash_message_success','Product has been deleted successfully!');
         }else{
            return redirect()->back()->with('flash_message_error','Product image  could not deleted because there is no image');
        }
    }
    public function deleteProductIimage($id=null){
    	$pImages = Product::where(['id'=>$id])->first();

        $file = $pImages->image;

        $file1 = public_path().'/backend/images/products/small/'.$file;
        $file2 = public_path().'/backend/images/products/medium/'.$file;
        $file3 = public_path().'/backend/images/products/large/'.$file;
        
        $filename = array($file1, $file2, $file3);
        $exists = false;
        
        foreach ($filename as $file) {
            if (file_exists($file)) {
                $exists = true;
            }
        }
        if ($exists == true) {
            foreach($filename as $file) {
                unlink($file);
            }
        return redirect()->back()->with('flash_message_success','Product Image has been deleted successfully!');
        }else{
            return redirect()->back()->with('flash_message_error','Product image  could not deleted because there is no image');
        }

        //File::delete($filename);
    }
    public function addAttributes(Request $request, $id=null){
        $productDetails = Product::with('attributes')->where(['id'=>$id])->first();
        // $productDetails = json_decode(json_encode($productDetails));
        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>"; print_r($data); die;
            foreach($data['sku'] as $key => $val){
                if(!empty($val)){
                    $attribute = new ProductsAttribute;
                    $attribute->product_id = $id;
                    $attribute->sku = $val;
                    $attribute->size = $data['size'][$key];
                    $attribute->price = $data['price'][$key];
                    $attribute->stock = $data['stock'][$key];
                    $attribute->save();
                }
            }

            return redirect('admin/add-attributes/'.$id)->with('flash_message_success','Product Attributes has been added successfully!');
        }
        return view('admin.products.add_attributes')->with(compact('productDetails'));
    }
    public function deleteAttribute($id=null){
        ProductsAttribute::where(['id'=>$id])->delete();
        return redirect()->back()->with('flash_message_success','Attribute has been deleted successfully!');
    }
    public function products($url=null){

        $categories = Category::with('categories')->where(['parent_id'=>0])->get();

        $categoryDetails = Category::where(['url' => $url])->first();

        //$allProducts = Product::where(['category_id' => $categoryDetails->id])->get();

        return view('product.listing')->with(compact('categories','categoryDetails','allProducts'));
    }
}
