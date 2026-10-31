/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        ink: "#1a1f24",
        "ink-soft": "#637081",
        panel: "#ffffff",
        bg: "#f1f3f5",
        line: "#dde3e8",
        head: "#1e3a5f",
        blue: "#2a5c8a",
        "blue-soft": "#e4edf5",
        red: "#b3261e",
        "red-soft": "#fbe9e7",
        grey: "#5c6672",
        "grey-soft": "#eef1f4",
        green: "#3a6b4d",
        "green-soft": "#e7efe9",
        amber: "#9c6b1f",
        "amber-soft": "#f6eedc",
      },
    },
  },
  plugins: [],
};
