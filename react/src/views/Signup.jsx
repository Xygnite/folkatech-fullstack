import React, { useRef, useState } from "react";
import { Link } from "react-router-dom";
import axiosClient from "../axios-client";
import { useStateContext } from "../contexts/ContextProvider";

export default function Signup() {
    const lastNameRef = useRef();
    const firstNameRef = useRef();
    const emailRef = useRef();
    const passwordRef = useRef();
    const passwordConfirmationRef = useRef();
    const phoneNumberRef = useRef();
    const [errors, setErrors] = useState(null);
    // const [details, setDetails] = useState(false);

    const { setToken, setUser } = useStateContext();

    const onSubmit = (e) => {
        e.preventDefault();
        const payload = {
            name: firstNameRef.current.value,
            last_name: lastNameRef.current.value,
            email: emailRef.current.value,
            password: passwordRef.current.value,
            c_password: passwordConfirmationRef.current.value,
            phone_number: phoneNumberRef.current.value,
        };

        console.log(payload);
        axiosClient
            .post("/register", payload)
            .then(({ data }) => {
                setUser(data.user);
                setToken(data.token);
            })
            .catch((error) => {
                // console.log(error);
                const response = error.response;
                if (response && response.status === 402) {
                    console.log(response.data.errors);
                }
                if (response && response.status === 422) {
                    console.log(response.data.errors);
                    setErrors(response.data.errors);
                }
            });
    };
    return (
        <div className="login-signup-form animated fadeInDown">
            <div className="form">
                <form onSubmit={onSubmit}>
                    <h1 className="title text-secondary">Daftar Sekarang</h1>

                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={firstNameRef}
                        type="text"
                        placeholder="First Name"
                    />
                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={lastNameRef}
                        type="text"
                        placeholder="Last Name"
                    />
                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={emailRef}
                        type="email"
                        placeholder="Email Address"
                    />
                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={phoneNumberRef}
                        type="text"
                        placeholder="Phone Number"
                    />
                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={passwordRef}
                        type="password"
                        placeholder="Password"
                    />
                    <input
                        className="form-input rounded border-none block w-full my-2 drop-shadow"
                        ref={passwordConfirmationRef}
                        type="password"
                        placeholder="Password Confirmation"
                    />
                    {errors && (
                        <div className="alert">
                            {Object.keys(errors).map((key) => (
                                <p key={key}>{errors[key][0]}</p>
                            ))}
                        </div>
                    )}

                    <button className="btn btn-block">SELANJUTNYA</button>
                    <p className="message">
                        Sudah punya akun? <Link to={"/user/login"}>Masuk</Link>
                    </p>
                </form>
            </div>
        </div>
    );
}
