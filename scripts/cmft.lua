--
-- Copyright 2014-2015 Dario Manesku. All rights reserved.
-- License: http://www.opensource.org/licenses/BSD-2-Clause
--

function cmftProject(_cmftDir)

    local CMFT_INCLUDE_DIR  = (_cmftDir .. "include/")
    local CMFT_SRC_DIR      = (_cmftDir .. "src/cmft/")

    local BX_INCLUDE_DIR    = (_cmftDir .. "dependency/bx/include/")
    local BX_THIRDPARTY_DIR = (_cmftDir .. "dependency/bx/3rdparty/")

    local DM_INCLUDE_DIR    = (_cmftDir .. "dependency/dm/include/")

    project "cmft"
        uuid("0809b9fb-eaf6-4e80-9d80-7b490e29f212")
        kind "StaticLib"

        configuration { "linux-*" }
            links
            {
                "dl",
                "pthread",
            }

        configuration { "vs*" }
            buildoptions
            {
                "/wd 4127" -- disable 'conditional expression is constant' for do {} while(0)
            }

        configuration {}

        files
        {
            CMFT_SRC_DIR .. "**.h",
            CMFT_SRC_DIR .. "**.cpp",
            CMFT_SRC_DIR .. "**/**.h",
            CMFT_SRC_DIR .. "**/**.cpp",

            CMFT_INCLUDE_DIR .. "**.h",
        }

        includedirs
        {
            DM_INCLUDE_DIR,
            BX_INCLUDE_DIR,
            BX_THIRDPARTY_DIR,
            CMFT_INCLUDE_DIR,
            CMFT_SRC_DIR,
        }

end -- cmftProject

-- vim: set sw=4 ts=4 expandtab:
