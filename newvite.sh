#!/bin/bash

new_vite () {
    echo "Creating new Project..."
    yarn create vite $1 --template $2
    cd $1
    yarn

    # Add Tailwind if parameter exists
    if [ $3 == "tw" ]; then
        yarn add -D tailwindcss postcss autoprefixer
        yarn tailwindcss init -p
    fi
    cd src  
    mkdir -p components/{Header,Footer,Layout}; touch components/{Header/index.js,Footer/index.js,Layout/Layout.js}
    mkdir -p pages data hooks
    echo "Everything OK!"
    echo "Done. Now run"
    echo ""
    echo "cd $1"
}   

new_vite $1 $2 $3

