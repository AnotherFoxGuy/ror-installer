cmake_minimum_required(VERSION 3.18)
project(ror-installer LANGUAGES NONE)

add_custom_target(
        compile ALL
        COMMAND iscc ${CMAKE_SOURCE_DIR}/RoR_Setup.iss
        VERBATIM
)

add_custom_target(
        compile_with_contentpack ALL
        COMMAND iscc ${CMAKE_SOURCE_DIR}/RoR_Setup_with_ContentPack.iss
        VERBATIM
)

add_custom_target(
        7z_zip
        COMMAND 7z a setup-content.7z .\\Build_ContentPack\\*
        VERBATIM
)

add_custom_target(
        7z_setup
        COMMAND copy /b 7zSD.sfx + config.txt + setup-content.7z RoR_2021.02_Setup_with_ContentPack.exe
        VERBATIM
)