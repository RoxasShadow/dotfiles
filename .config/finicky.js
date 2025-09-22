export default {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: [
        "*google.com/*",
        "*github.com/*",
        "*okta.com/*",
        "*amazonaws.com/*",
        "*simplybusiness*",
      ],
      browser: "Google Chrome",
    },
  ],
};
