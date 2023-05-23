import React, { useEffect, useState } from "react";
import {
    BsChevronDown,
    BsChevronUp,
    BsStar,
    BsStarFill,
    BsStarHalf,
} from "react-icons/bs";
import RangeSlider from "react-range-slider-input";
import axiosClient from "../axios-client";
import { Link } from "react-router-dom";
// import "react-range-slider-input/dist/style.css";

export default function Products() {
    const [content, setContent] = useState([]);
    const [filter, setFilter] = useState([
        {
            title: "Origin",
            content: [
                { name: "Aceh", count: 8 },
                { name: "Semarang", count: 2 },
                { name: "Bandung", count: 7 },
                { name: "Jawa", count: 5 },
                { name: "Amerika Selatan", count: 6 },
                { name: "Lain - lain", count: 8 },
            ],
        },
        {
            title: "Species",
            content: [
                { name: "Arabika", count: 128 },
                { name: "Robusta", count: 23 },
                { name: "Blend", count: 9 },
            ],
        },
        {
            title: "Roast Level",
            content: [
                { name: "Light Roast", count: 8 },
                { name: "Medium Roast", count: 2 },
                { name: "Dark Roast", count: 7 },
                { name: "Light to Medium Roast", count: 5 },
            ],
        },
        {
            title: "Taste",
            content: [
                { name: "Sweet", count: 18 },
                { name: "Floral", count: 21 },
                { name: "Fruity", count: 7 },
                { name: "Nutty", count: 5 },
                { name: "Cocoa", count: 21 },
                { name: "Spices", count: 18 },
            ],
        },
        {
            title: "Processing",
            content: [
                { name: "Honey White", count: 8 },
                { name: "Natural", count: 2 },
                { name: "Honey Gold", count: 7 },
                { name: "Honey Yellow", count: 5 },
            ],
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

    useEffect(() => {
        getData();
    }, []);

    const getData = () => {
        axiosClient
            .get("/products")
            .then(({ data }) => {
                setContent(data.data);
            })
            .catch(() => {});
    };

    const renderContent = () => (
        <>
            {content.map((v, i) => (
                <Link to={`/products/detail/${v.id}`}>
                    <div
                        className="border drop-shadow card justify-center items-center"
                        key={i}
                    >
                        <div className="">
                            <img
                                // src={v.image}
                                src={"/coffee-bag-mockup.jpg"}
                                className="object-cover h-[26rem] w-[22rem]"
                            ></img>
                        </div>
                        <div className="w-full text-center text-lg text-gray">
                            {v.name}
                        </div>
                        <div className="w-full text-center text-sm">
                            {v.vendor}
                        </div>
                        <div className="w-full justify-center flex">
                            {renderStars(v.rating)}
                        </div>
                        <div className="w-full text-center text-primary text-lg">
                            Rp. {parseFloat(v.price).toLocaleString("id")}
                        </div>
                    </div>
                </Link>
            ))}
        </>
    );
    const renderAllCheckboxFilter = () => (
        <>{filter.map((f) => renderCheckboxFilter(f))}</>
    );
    const renderCheckboxFilter = (filter) => {
        const [opened, setOpened] = useState(false);
        return (
            <>
                <div
                    className="flex justify-between items-center bg-slate-200 border-b-2 border-slate-300 px-4 py-2"
                    onClick={() => {
                        setOpened(!opened);
                    }}
                >
                    <div>{filter.title}</div>
                    {opened ? <BsChevronUp /> : <BsChevronDown />}
                </div>
                {opened &&
                    filter.content.map((v, i) => (
                        <div>
                            <div className="flex items-center px-4">
                                <input
                                    type="checkbox"
                                    className="mr-2 bg-slate-200 border-none"
                                />
                                <div className="flex justify-between w-full">
                                    <div>{v.name}</div> <div>({v.count})</div>
                                </div>
                            </div>
                        </div>
                    ))}
            </>
        );
    };
    return (
        <div className="flex p-20 justify-between">
            <div className=" min-w-[16rem]">
                <div className="flex justify-between items-center  px-4 py-2">
                    <div className="text-lg">URUTKAN BERDASARKAN</div>{" "}
                    <BsChevronUp className="" />
                </div>
                <div>
                    <div className="text-lg">Harga</div>
                    <div className="py-2">
                        <RangeSlider />
                    </div>
                    <div className="flex my-2">
                        <div className="mx-2"> Rp.</div>
                        <input className="border bg-slate-200 w-[8rem]"></input>
                        <div className="mx-2">- Rp.</div>
                        <input className="border bg-slate-200 w-[8rem]"></input>
                    </div>
                </div>
                <div>{renderAllCheckboxFilter()}</div>
            </div>
            <div>
                <div className="grid grid-cols-3 grid-rows-4 gap-4">
                    {renderContent()}
                </div>
            </div>
        </div>
    );
}
