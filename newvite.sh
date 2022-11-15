#!/bin/bash

new_vite () {

echo "Creating new Project..."
yarn create vite $1 --template react
cd $1
yarn
    
# Add Tailwind if parameter exists
yarn add -D tailwindcss postcss autoprefixer
yarn tailwindcss init -p
cat << TEXTFILE > postcss.config.cjs
module.exports = {
  plugins: {
      tailwindcss: {},
      autoprefixer: {},
  },
}
TEXTFILE
cat << TEXTFILE > tailwind.config.cjs
/** @type {import('tailwindcss').Config} */
module.exports = {
content: [
    "./src/**/*.{js,jsx,ts,tsx}",
],
theme: {
    extend: {},
},
plugins: [],
}
TEXTFILE
cd src
cat << TEXTFILE > index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
TEXTFILE

rm App.css 

cat << TEXTFILE > App.jsx
import Header from './components/Header'
import Footer from './components/Footer'
function App() {

  return (
    <div className="App h-screen flex flex-col justify-between">
      <Header />
      <Footer />
    </div>
  )
}

export default App

TEXTFILE

#### Create components
mkdir -p components/{Header,Footer}; 
mkdir -p pages data hooks
cd components/Footer
cat << TEXTFILE > index.jsx
import React from "react";

const Footer = () => {
  return (
    <footer>
      <div class="bg-gray-100">
        <div class="container mx-auto py-4 px-5 flex flex-wrap flex-col sm:flex-row">
          <p class="text-gray-500 text-sm text-center sm:text-left">
            © 2022 — Federico
            <a
              href="https://twitter.com/nvFede2"
              class="text-gray-600 ml-1"
              target="_blank"
              rel="noopener noreferrer"
            >
              @nvFede2
            </a>
          </p>
          <span class="sm:ml-auto sm:mt-0 mt-2 sm:w-auto w-full sm:text-left text-center text-gray-500 text-sm">
            Lorem ipsum dolor sit amet.
          </span>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
TEXTFILE
cd ..
cd Header
cat << TEXTFILE > index.jsx
import React from "react";

const Header = () => {
  return (
    <header class="text-gray-600 body-font">
      <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
          <span class="ml-3 text-xl">Web Logo</span>
        </a>
        <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
          <a class="mr-5 hover:text-gray-900">First Link</a>
          <a class="mr-5 hover:text-gray-900">Second Link</a>
          <a class="mr-5 hover:text-gray-900">Third Link</a>
          <a class="mr-5 hover:text-gray-900">Fourth Link</a>
        </nav>
      </div>
    </header>
  );
};

export default Header;
TEXTFILE
cd ..



echo "Everything OK!"
echo "=============="
echo "Done. Now run"
echo "--------------"
echo ""
echo "cd $1"
echo "npm run dev"    
    
    
    

    
    
    
}

new_vite $1 