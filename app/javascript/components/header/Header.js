import React from "react";
import "./Header.css";
import { Fade } from "react-reveal";
import { NavLink } from "react-router-dom";
import SeoHeader from "../seoHeader/SeoHeader";
import { useAuth } from "../../AuthContext.js";
import { useContext } from "react";
import { SiteConfigContext } from "../../containers/Main";

const Header = ({ theme }) => {
  const { user, loading } = useAuth();
  const { siteConfig } = useContext(SiteConfigContext);
  const link = siteConfig?.splash ? "/splash" : "/home";

  return (
    <Fade top duration={1000} distance="20px">
      <SeoHeader />
      <header className="header">
        <NavLink to={link} className="logo">
          <span style={{ color: theme.text }}> &lt;</span>
          <span className="logo-name" style={{ color: theme.text }}>
            {siteConfig?.logoName}
          </span>
          <span style={{ color: theme.text }}>/&gt;</span>
        </NavLink>

        <input className="menu-btn" type="checkbox" id="menu-btn" />
        <label className="menu-icon" htmlFor="menu-btn">
          <span className="navicon"></span>
        </label>

        <ul className="menu" style={{ backgroundColor: theme.body }}>
          {siteConfig?.menuItems?.map((item) => (
            <li className="list-menu" key={item.to}>
              <NavLink
                to={item.to}
                className={({ isActive }) =>
                  `menu-link ${isActive ? "active" : ""}`
                }
                style={{ color: theme.text, fontSize: "1.2em" }}
              >
                {item.label}
              </NavLink>
            </li>
          ))}

          {!loading && user?.role === "admin" && (
            <li className="list-menu">
              <a
                href="/superadmin"
                className="menu-link "
                style={{ color: theme.text, fontSize: "1.2em" }}
                target="_blank"
              >
                Admin Dashboard
              </a>
            </li>
          )}
        </ul>
      </header>
    </Fade>
  );
};

export default Header;
