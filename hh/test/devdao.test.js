const { expect } = require("chai");
const { ethers } = require("hardhat");

// Helpers
const parseJwt = (token) => {
  const base64 = token.replace(/-/g, '+').replace(/_/g, '/');
  const jsonPayload = decodeURIComponent(
    Buffer.from(base64, 'base64')
      .toString()
      .split('')
      .map((c) => {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      })
      .join(''),
  );

  return JSON.parse(jsonPayload);
};

describe("Dev", () => {
  /**
   * 
   */
  it("Should return a clothing item", async function () {
    // Setup
    const Dev = await ethers.getContractFactory("Dev");
    const dev = await Dev.deploy();
    const DEV_ID = 1;
    const EXPECTED_RESULT = "White Tanktop";

    // Deploy
    await dev.deployed();

    // Init
    const clothing = await dev.getClothing(DEV_ID);

    // Expectations
    expect(clothing).to.equal(EXPECTED_RESULT);
  });

  /**
   * 
   */
  it("Should return a jwt for an svg", async function () {
    // Setup
    const Dev = await ethers.getContractFactory("Dev");
    const dev = await Dev.deploy();
    const DEV_ID = 1;
    const EXPECTED_RESULT = {
      name: 'Dev #1',
      description: 'Developers around the world are tired of working and contributing their time and effort to enrich the top 1%. Join the movement that is community owned, building the future from the bottom up.',
      image: 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaW5ZTWluIG1lZXQiIHZpZXdCb3g9IjAgMCAzNTAgMzUwIj48c3R5bGU+LmJhc2UgeyBmaWxsOiBibGFjazsgZm9udC1mYW1pbHk6IHNlcmlmOyBmb250LXNpemU6IDE0cHg7IH08L3N0eWxlPjxyZWN0IHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9IndoaXRlIiAvPjx0ZXh0IHg9IjEwIiB5PSIyMCIgY2xhc3M9ImJhc2UiPm1hY09TPC90ZXh0Pjx0ZXh0IHg9IjEwIiB5PSI0MCIgY2xhc3M9ImJhc2UiPkJyYWNrZXRzPC90ZXh0Pjx0ZXh0IHg9IjEwIiB5PSI2MCIgY2xhc3M9ImJhc2UiPldoaXRlIFRhbmt0b3A8L3RleHQ+PHRleHQgeD0iMTAiIHk9IjgwIiBjbGFzcz0iYmFzZSI+U2NhbGE8L3RleHQ+PHRleHQgeD0iMTAiIHk9IjEwMCIgY2xhc3M9ImJhc2UiPkdvdmVybm1lbnQ8L3RleHQ+PHRleHQgeD0iMTAiIHk9IjEyMCIgY2xhc3M9ImJhc2UiPktpc3VtdTwvdGV4dD48dGV4dCB4PSIxMCIgeT0iMTQwIiBjbGFzcz0iYmFzZSI+RGl2ZXJnZW50PC90ZXh0Pjx0ZXh0IHg9IjEwIiB5PSIxNjAiIGNsYXNzPSJiYXNlIj5Kb25Hb2xkPC90ZXh0Pjwvc3ZnPg=='
    };

    // Deploy
    await dev.deployed();

    // Init
    const jwt = (await dev.tokenURI(DEV_ID)).replace('data:application/json;base64,', '');
    const json = parseJwt(jwt);

    // Expectations
    expect(json.name).to.equal(EXPECTED_RESULT.name);
    expect(json.description).to.equal(EXPECTED_RESULT.description);
    expect(json.image).to.equal(EXPECTED_RESULT.image);
  });
});
