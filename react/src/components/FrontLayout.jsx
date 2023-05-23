import React, { useEffect, useState } from "react";
import {
    Link,
    Navigate,
    Outlet,
    useNavigate,
    useParams,
} from "react-router-dom";
import { useStateContext } from "../contexts/ContextProvider";
import axiosClient from "../axios-client";
import "react-responsive-carousel/lib/styles/carousel.min.css"; // requires a loader
import { Carousel } from "react-responsive-carousel";
import {
    BsChevronDoubleRight,
    BsChevronDown,
    BsHeart,
    BsPerson,
    BsSearch,
} from "react-icons/bs";
import { FiShoppingBag } from "react-icons/fi";

export default function FrontLayout() {
    const { user, token, notification, setUser, setToken } = useStateContext();
    if (!token) {
        return <Navigate to={"/user/login"} />;
    }
    const [loading, setLoading] = useState(false);
    const [errors, setErrors] = useState(null);
    const { setNotification } = useStateContext();
    const [breadCrumbs, setBreadCrumbs] = useState([
        "Home",
        "Produk",
        "Roasted Beans",
    ]);
    useEffect(() => {
        getBanners();
    }, []);
    const getBanners = () => {
        setLoading(true);
        axiosClient
            .get("/banners")
            .then(({ data }) => {
                setLoading(false);
                console.log(data.data);
                setBanners(data.data);
            })
            .catch(() => {
                setLoading(false);
            });
    };

    const renderBreadCrumbs = () => {
        return (
            <div className="justify-start flex py-8 px-12 items-center">
                {breadCrumbs.map((v, i) => (
                    <>
                        {i != 0 && <BsChevronDoubleRight />}
                        <div
                            className={
                                i == breadCrumbs.length - 1
                                    ? "px-2 text-primary"
                                    : "px-2"
                            }
                        >
                            {v}
                        </div>
                    </>
                ))}
            </div>
        );
    };
    return (
        <div id="defaultLayout">
            <div className="content">
                <header className="">
                    <div className="justify-between flex bg-white">
                        <div></div>
                        {/* brand */}
                        <div className="flex py-5">
                            <form className="flex mx-6">
                                <input
                                    className="form-input rounded-l-lg  h-full border-none drop-shadow"
                                    placeholder="Cari Produk..."
                                />
                                <div className="bg-primary h-full rounded-r-lg drop-shadow justify-center items-center flex py-4 px-6">
                                    <BsSearch color="white" size={18} />
                                </div>
                            </form>
                            <div className="flex h-full mr-16">
                                <div className="py-4 px-2 justify-center items-center">
                                    <BsHeart color="" size={20} />
                                </div>
                                <div className="py-4 px-2 justify-center items-center">
                                    <FiShoppingBag size={20} />
                                </div>
                                <div className="flex py-4 px-2 justify-center items-center">
                                    <BsPerson size={20} />
                                    <BsChevronDown size={12} />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="justify-start flex bg-slate-300">
                        <div className="flex justify-center items-center mx-12 px-10 py-4 text-white text-lg bg-primary">
                            Belanja <BsChevronDown className="ml-2" />
                        </div>
                    </div>
                    {renderBreadCrumbs()}
                </header>
                <main>
                    <Outlet />
                </main>
            </div>
            {notification && <div className="notification">{notification}</div>}
        </div>
    );
}
