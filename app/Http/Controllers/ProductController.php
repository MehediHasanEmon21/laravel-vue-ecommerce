<?php

namespace App\Http\Controllers;

use App\Model\Category;
use App\Brand;
use Illuminate\Http\Request;
use App\Model\Product;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($number = 10)
    {
        $products = Product::latest()->paginate($number);
        return response()->json([
            'products' => $products

        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->productValidation($request);
        $request['color'] = explode(',', $request->color);
        $request['size'] = explode(',', $request->size);
        $file = '';
        $upload_path = public_path('uploads');
        if ($request->hasFile('image')) {

            $file = $request->file('image');
            $name = time() . '-' . $file->getClientOriginalName();
            $file->move($upload_path, $name);
        }
        $product = new Product();
        $product->create(array_merge($request->all(), ['image' => $name]));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = Product::find($id);
        return response()->json([
            'product' => $product

        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id)->delete();
        return $this->index();
    }

    public function updateProduct(Request $request, $id)
    {
        $this->productValidation($request, $id);
        $product = Product::find($id);
        $request['color'] = explode(',', $request->color);
        $request['size'] = explode(',', $request->size);
        $file = '';
        $upload_path = public_path('uploads');
        if ($request->hasFile('image')) {
            $file_path = public_path('uploads/' . $product->image);
            if (file_exists($file_path)) {
                unlink($file_path);
            }

            $file = $request->file('image');
            $name = time() . '-' . $file->getClientOriginalName();
            $file->move($upload_path, $name);
        } else {
            $name = $product->image;
        }

        $product->update(array_merge($request->all(), ['image' => $name]));
    }

    public function multiDelete(Request $request)
    {


        foreach ($request->all() as $product) {
            $product = Product::find($product['id']);
            $product->delete();
        }
    }

    public function productValidation($request, $id = null)
    {
        if ($id) {
            $image = '';
        } else {
            $image = 'required|image';
        }
        $request->validate(
            [
                'name' => 'required',
                'category_id' => 'required',
                'brand_id' => 'required',
                'image' => $image,
                'price' => 'required',
                'discount_price' => 'required',
                'color' => 'required',
                'size' => 'required',
                'quantity' => 'required',
                'description' => 'required',
            ],
            [
                'category_id.required' => 'category is required',
                'brand_id.required' => 'brand is required',

            ]
        );
    }

    public function getFronendProduct()
    {
        if (!\Request::ajax()) {
            return abort(404);
        }
        return $this->index(15);
    }

    public function getProductSideBarInfo()
    {

        $categories = Category::orderBy('name', 'ASC')->get();
        $brands = Brand::orderBy('name', 'ASC')->get();
        $min_price = Product::min('price');
        $max_price = Product::max('price');

        return response()->json([
            'categories' => $categories,
            'brands' => $brands,
            'price' => [
                'min_price' => $min_price,
                'max_price' => $max_price,
            ]
        ]);
    }

    public function productFilter($data)
    {
        $data = json_decode($data);

        $field = $data->field;
        $data = $data->data;

        if ($field === 'price') {

            $products = $this->priceRangeFilter($data);
        } elseif ($field == 'size' || $field == 'color') {
            $products = $this->sizeColorEilter($data, $field);
        } elseif ($field == 'category_id' || $field == 'brand_id') {
            $products = Product::where($field, $data)->orderBy('id', 'DESC')->paginate(15);
        } else {
            $products = $this->index(15);
        }

        return response()->json([
            'products' => $products

        ]);
    }

    public function priceRangeFilter($data)
    {

        $min = $data['0'];
        $max = $data['1'];

        $products = Product::whereBetween('price', [$min, $max])->orderBy('id', 'DESC')->paginate(15);
        return $products;
    }

    public function sizeColorEilter($data, $field)
    {

        $products = Product::query()->where($field, 'like', "%{$data}%")->paginate(15);
        return $products;
    }
}
