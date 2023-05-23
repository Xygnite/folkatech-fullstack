import React, { useRef, useState } from "react";
import { Link } from "react-router-dom";
import axiosClient from "../axios-client";
import { useStateContext } from "../contexts/ContextProvider";

export default function Login() {
    const emailRef = useRef();
    const passwordRef = useRef();
    const { setToken, setUser } = useStateContext();
    const [errors, setErrors] = useState(null);
    const onSubmit = (e) => {
        e.preventDefault();
        const payload = {
            email: emailRef.current.value,
            password: passwordRef.current.value,
        };
        setErrors(null);
        axiosClient
            .post("/login", payload)
            .then((response) => {
                setToken(response.data.token);
                setUser(response.data.user);
            })
            .catch((errors) => {
                const response = errors.response;
                if (response && response.status === 402) {
                    console.log(response.data.errors);
                }
                if (response && response.status === 422) {
                    console.log(response.data.errors);
                    if (response.data.errors) {
                        setErrors(response.data.errors);
                    } else {
                        setErrors({ email: [response.data.message] });
                    }
                }
            });
    };
    return (
        <div className="login-signup-form rounded drop-shadow">
            <div className="form">
                <form onSubmit={onSubmit}>
                    <h1 className="title text-secondary">Masuk</h1>
                    {errors && (
                        <div className="alert">
                            {Object.keys(errors).map((key) => (
                                <p key={key}>{errors[key][0]}</p>
                            ))}
                        </div>
                    )}
                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={emailRef}
                        type="email"
                        placeholder="Email"
                    />
                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={passwordRef}
                        type="password"
                        placeholder="Password"
                    />
                    <button className="btn btn-block rounded drop-shadow">
                        Login
                    </button>
                    <div class="relative flex mt-5 items-center">
                        <div class="flex-grow border-t border-gray-400"></div>
                    </div>
                    <p className="message">
                        Belum punya akun?{" "}
                        <Link to={"/user/signup"}>Daftar Sekarang</Link>
                    </p>
                </form>
            </div>
        </div>
    );
}
