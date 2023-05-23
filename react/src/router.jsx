import { Navigate, createBrowserRouter } from "react-router-dom";
import Login from "./views/Login";
import Signup from "./views/Signup";
import Notfound from "./views/Notfound";
import GuestLayout from "./components/GuestLayout";
import FrontLayout from "./components/FrontLayout";
import Products from "./views/Products";
import ProductDetails from "./views/ProductDetails";

const router = createBrowserRouter([
    {
        path: "/user",
        element: <GuestLayout />,
        children: [
            { path: "/user", element: <Navigate to={"/user/login"} /> },
            {
                path: "/user/login",
                element: <Login />,
            },
            {
                path: "/user/signup",
                element: <Signup />,
            },
        ],
    },
    {
        path: "/",
        element: <FrontLayout />,
        children: [
            { path: "/", element: <Navigate to={"/products"} /> },
            {
                path: "/products",
                element: <Products />,
            },
            {
                path: "/products/detail/:id",
                element: <ProductDetails />,
            },
        ],
    },
    {
        path: "*",
        element: <Notfound />,
    },
]);
export default router;
