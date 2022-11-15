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
