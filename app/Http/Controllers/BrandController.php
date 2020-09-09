<?php

namespace App\Http\Controllers;

use App\Brand;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $brands = Brand::latest()->paginate(5);
        return response()->json([
            'brands' => $brands

        ]);
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
        $this->validate($request, [
            'name' => 'required'
        ]);

        $Brand = new Brand();
        $Brand->name = $request->name;
        $Brand->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function show(Brand $Brand)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function edit(Brand $Brand)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Brand $Brand)
    {
        $this->validate($request, [
            'name' => 'required'
        ]);
        $Brand->name = $request->name;
        $Brand->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function destroy(Brand $Brand)
    {
        $Brand->delete();
        return $this->index();
    }

    public function multiDelete(Request $request)
    {
        $data = $request->all();

        for ($i = 0; $i < count($data); $i++) {
            $Brand = Brand::find($data[$i]['id']);
            $Brand->delete();
        }
    }

    public function allBrand()
    {
        $brands = Brand::orderBy('name', 'ASC')->get();
        return response()->json([
            'brands' => $brands

        ]);
    }
}
