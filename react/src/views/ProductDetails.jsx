import React, { useEffect, useState } from "react";
import {
    BsChevronDown,
    BsChevronUp,
    BsDash,
    BsHeart,
    BsPlus,
    BsStar,
    BsStarFill,
    BsStarHalf,
} from "react-icons/bs";
import RangeSlider from "react-range-slider-input";
import { useParams } from "react-router-dom";
import axiosClient from "../axios-client";
// import "react-range-slider-input/dist/style.css";

export default function ProductDetails() {
    const [content, setContent] = useState({
        image: "/coffee-bag-mockup.jpg",
        name: "ABID CLEVER DRIPPER 102",
        brand: "UBRUKOPI",
        rating: 4.5,
        price: 100000,
        description: `Dapatkan French Press Coffee Maker dari Waterground Coffee sekarang juga dan nikmati sensasi kopi fresh yang tak tertandingi setiap hari. Coba sekarang dan rasakan perbedaannya!


        SPESIFIKASI PRODUK
        
        Bahan Gelas : Type 1 Borosillicate Glass (All Variants)
        Bahan Bodi : Stainless Steel 203 (Varian Bodum, AKB, Limeili)
        PP (polypropylene) (Varian CRS, TOP)
        Ukuran : 350, 600, 800, 1000 ML (Sesuai Varian)
        Bahan Saringan : Stainless Steel 304 Mesh (Semua Varian)`,
    });

    const [recommend, setRecommend] = useState([
        {
            image: "/coffee-bag-mockup.jpg",
            name: "ABID CLEVER DRIPPER 102",
            brand: "UBRUKOPI",
            rating: 4.5,
            price: 100000,
        },
        {
            image: "/coffee-bag-mockup.jpg",
            name: "ABID CLEVER DRIPPER 102",
            brand: "UBRUKOPI",
            rating: 4,
            price: 100000,
        },
        {
            image: "/coffee-bag-mockup.jpg",
            name: "ABID CLEVER DRIPPER 102",
            brand: "UBRUKOPI",
            rating: 4,
            price: 100000,
        },
    ]);

    const renderRateStar = (rateStar) => (
        <>
            {console.log(rateStar)}
            {rateStar == 0 ? (
                <BsStar color="gold" />
            ) : rateStar == 1 ? (
                <BsStarFill color="gold" />
            ) : (
                <BsStarHalf color="gold" />
            )}
        </>
    );
    const renderStars = (rating) => {
        let stars = [];
        let rate = rating;
        for (let index = 0; index < 5; index++) {
            if (rate >= 1) {
                stars.push(1);
                rate -= 1;
                continue;
            }
            stars.push(rate);
            rate = 0;
        }

        return stars.map((v, i) => <>{renderRateStar(v)}</>);
    };

    const renderContent = () => (
        <>
            {recommend.map((v, i) => (
                <div className="border drop-shadow card justify-center items-center">
                    <div className="">
                        <img
                            src={v.image}
                            className="object-cover h-[26rem]"
                        ></img>
                    </div>
                    <div className="w-full text-center text-lg text-gray">
                        {v.name}
                    </div>
                    <div className="w-full text-center text-sm">{v.brand}</div>
                    <div className="w-full justify-center flex">
                        {renderStars(v.rating)}
                    </div>
                    <div className="w-full text-center text-primary text-lg">
                        Rp. {v.price.toLocaleString("id")}
                    </div>
                </div>
            ))}
        </>
    );
    const { id } = useParams();

    useEffect(() => {
        getData();
    }, []);

    const getData = () => {
        axiosClient
            .get(`/products/${id}`)
            .then(({ data }) => {
                setContent(data);
            })
            .catch(() => {});
    };

    return (
        <div className="px-40 py-10 justify-between">
            <div className="flex">
                <div>
                    <img
                        // src={content.image}
                        src="/coffee-bag-mockup.jpg"
                        className="object-cover h-[40rem] w-[40rem] border-2 p-1"
                    ></img>
                    <div className="flex">
                        <img
                            // src={content.image}
                            src="/coffee-bag-mockup.jpg"
                            className="object-cover h-[12rem] border-2 p-1"
                        ></img>
                        <img
                            // src={content.image}
                            src="/coffee-bag-mockup.jpg"
                            className="object-cover h-[12rem] border-2 p-1"
                        ></img>
                        <img
                            // src={content.image}
                            src="/coffee-bag-mockup.jpg"
                            className="object-cover h-[12rem] border-2 p-1"
                        ></img>
                    </div>
                </div>
                <div className="px-20 max-w-[60rem]">
                    <div className="text-2xl text-gray">{content.name}</div>
                    <div className="text-lg">{content.brand}</div>
                    <div className="flex">{renderStars(content.rating)}</div>
                    <div className="text-primary text-2xl">
                        Rp. {content.price.toLocaleString("id")}
                    </div>
                    <div className="flex py-2">
                        <div className="flex border border-slate-200  w-[3rem] justify-center items-center text-center mr-1 ">
                            <BsDash />
                        </div>
                        <input
                            type="text"
                            className="form-input w-[5rem] text-center border-slate-200"
                            placeholder="1"
                        />
                        <div className="flex border border-slate-200  w-[3rem] justify-center items-center text-center mx-1">
                            <BsPlus />
                        </div>
                        <div className="flex justify-center items-center text-center px-4 bg-primary text-white mx-1">
                            {"TAMBAHKAN KE KERANJANG"}
                        </div>
                        <div className="flex justify-center items-center text-center px-4 bg-slate-200 text-white mx-1">
                            <BsHeart className="text-primary" />
                        </div>
                    </div>
                    <div className="text-lg text-slate-600">
                        {content.description}
                    </div>
                </div>
            </div>
            <div>
                <div className="flex justify-around items-center my-20">
                    <div className="text-2xl text-primary border-b-2 w-[20rem] border-primary text-center p-2">
                        {"DESKRIPSI"}
                    </div>
                    <div className="text-2xl w-[20rem]  text-center p-2">
                        {"INFORMASI"}
                    </div>
                </div>
                <div className="text-lg text-slate-600">
                    {content.description}
                </div>
            </div>
            <div className="my-10">
                <div className="text-2xl text-center p-2">
                    {"REKOMENDASI UNTUK ANDA"}
                </div>
                <div className="flex justify-center">
                    <div className="border-t-2 w-[10rem] border-primary"></div>
                </div>
            </div>
            <div>
                <div className="grid grid-cols-3 gap-4">{renderContent()}</div>
            </div>
        </div>
    );
}
