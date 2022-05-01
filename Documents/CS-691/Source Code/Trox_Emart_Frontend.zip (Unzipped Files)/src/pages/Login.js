import React from 'react';
import { Grid, Paper, Avatar, TextField, FormControlLabel, Checkbox, Button, Typography, Link } from '@material-ui/core';
import LockOutlinedIcon from '@material-ui/icons/LockOutlined';

// import { Link } from 'react-router-dom';

import './Login.css';

const Login = () => {

    return (
        <div className="login">
            <Link href="/">
            {/* change to trox logo */}
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/1024px-Amazon_logo.svg.png" alt="logo" className="login__logo" />
            </Link>
            <Grid>
                <Paper elevation={10} className="paper__style">
                    <Grid align="Center">
                        <Avatar id='avatar__style'>
                            <LockOutlinedIcon/>
                        </Avatar>
                        <h2>Sign In</h2>
                    </Grid>
                    <TextField label="Username" placeholder="Enter username" fullWidth required/>
                    <TextField label="Password" placeholder="Enter password" fullWidth required/>
                    <FormControlLabel
                        control={
                            <Checkbox
                                name="checkedB"
                                color="primary"
                            />
                        }
                        label="Remember me"
                    />
                    <Button type="submit" color="primary" variant="contained" id='btn__style' fullWidth>Sign In</Button>
                    <Typography>
                        <Link href="#">
                            Forgot Password ?
                        </Link>
                    </Typography>
                    <Typography> Do you have an account ?
                        <Link href="#">
                            Sign Up
                        </Link>
                    </Typography>
                </Paper>
            </Grid>
        </div>
    )
}

export default Login;


{/* <div className="login__container">
    <h1>Sign In</h1>
    <form>
        <h5>E-mail</h5>
        <input type="email" />
        <h5>Password</h5>
        <input type="password" />
        <button type="submit" className="login__signInButton">Sign In</button>
    </form>
    <p>By signing-in, you agree to Amazon's Terms and Conditions.</p>
    <button className="login__registerButton">Create your Amazon Account</button>
</div> */}