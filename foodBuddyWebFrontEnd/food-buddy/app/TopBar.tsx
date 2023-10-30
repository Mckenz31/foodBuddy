"use client";
import { AppBar, Container, Button, Toolbar } from "@mui/material";
import Link from "next/link";
import { styled } from "@mui/system";

type TopBarProps = {};

export const TopBar = ({}: TopBarProps) => {
  const buttonStyle = { margin: "0 8px" };
  const StyledButton = styled(Button)`
    color: white;
    &:hover {
      background-color: #ffbb00; // Change this to your desired hover color
    }
  `;

  return (
    <div>
      <AppBar
        position={`sticky`}
        sx={{
          position: "fixed",
          left: 0,
          right: 0,
          zIndex: 9999,
          backgroundColor: "transparent",
          boxShadow: "none",
        }}
      >
        <Toolbar sx={{ display: "flex", justifyContent: "center" }}>
          <div>
            <Link href="/">
              <StyledButton style={buttonStyle}>Home</StyledButton>
            </Link>
            <Link href="/inventory">
              <StyledButton style={buttonStyle}>Inventory</StyledButton>
            </Link>
            <Link href="/ingredients">
              <StyledButton style={buttonStyle}>
                Add new ingredients
              </StyledButton>
            </Link>
            <Link href="/recipes">
              <StyledButton style={buttonStyle}>Recipes</StyledButton>
            </Link>
          </div>
        </Toolbar>
      </AppBar>

      <Container
        maxWidth={`xl`}
        sx={{
          flex: 1,
          marginTop: "64px",
          backgroundColor: "#f7e2de",
        }}
      ></Container>
    </div>
  );
};
