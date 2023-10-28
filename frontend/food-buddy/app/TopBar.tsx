"use client";
import { AppBar, Container, Button, Toolbar } from "@mui/material";
import Link from "next/link";
import { styled } from "@mui/system";

type TopBarProps = {};

export const TopBar = ({}: TopBarProps) => {
  const buttonStyle = { margin: "0 8px" };
  const StyledButton = styled(Button)`
    &:hover {
      background-color: #e3b4ac; // Change this to your desired hover color
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
          background: "#e2a89f",
        }}
      >
        <Toolbar sx={{ display: "flex", justifyContent: "center" }}>
          <div>
            <Link href="/">
              <StyledButton variant="contained" style={buttonStyle}>
                Home
              </StyledButton>
            </Link>
            <Link href="/inventory">
              <StyledButton variant="contained" style={buttonStyle}>
                Inventory
              </StyledButton>
            </Link>
            <Link href="/ingredients">
              <StyledButton variant="contained" style={buttonStyle}>
                Add new ingredients
              </StyledButton>
            </Link>
            <Link href="/recipes">
              <StyledButton variant="contained" style={buttonStyle}>
                Recipes
              </StyledButton>
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
