<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;
use App\Models\Product;

class ProductController extends Controller
{


    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return ProductResource::collection(Product::get());
    }



    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        return response(new ProductResource($product), 200);
    }



}