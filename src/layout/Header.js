import React from 'react';
import SearchIcon from '@material-ui/icons/Search';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import { Link } from 'react-router-dom';


import './Header.css'

const Header = () => {
    return (
        <nav className="header">
        {/* add trox logo instead of amazon */}
        {/* importing local image from folder src={require('../assets/banner_image/banner_image_1.jpg')}*/}
            <img src="../assets/logo/trox.png" alt="logo" className="header__logo" />
            <div className="header__search">
                <input type="text" className="header__searchInput" />
                <SearchIcon className="header__searchIcon"/>
            </div>
            <div className="header__nav">
                {/* Link 1 */}
                <Link to="/" className="header__link">
                    <div className="header__option">
                        <span className="header__optionOne">
                            Hello, User
                        </span>
                        <span className="header__optionTwo">
                            Sign
                        </span>
                    </div>
                </Link>
                {/* Link 2 */}
                <Link to="/" className="header__link">
                    <div className="header__option">
                        <span className="header__optionOne">
                            Returns
                        </span>
                        <span className="header__optionTwo">
                            & Orders
                        </span>
                    </div>
                </Link>
            </div>
            {/* cart icon with number */}
            <Link to="/checkout" className="header__link">
                <div className="header__optionCart">
                    <ShoppingCartIcon/>
                    {/* number of item in cart */}
                    <span className="header__optionTwo header__cartCount">2</span>
                </div>
            </Link>
        </nav>
    )
}

export default Header;