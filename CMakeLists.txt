cmake_minimum_required(VERSION 3.5)
project(LaTeX NONE)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/UseLatexMk)
#set(LATEXMK_DIR ${PROJECT_SOURCE_DIR}/third_party)
include(UseLatexMk/UseLatexMk.cmake)

set(BUILD_DIR ${PROJECT_SOURCE_DIR}/build)
set(LECTURE_DIR ${PROJECT_SOURCE_DIR}/lecture)
set(LECTURE_TEMPLATE ${LECTURE_DIR}/template.tex)

function(make_lecture LECTURE_NAME)
    set(SOURCE_FILE ${CMAKE_CURRENT_BINARY_DIR}/${LECTURE_NAME}.tex)
    configure_file(${LECTURE_TEMPLATE} ${SOURCE_FILE} @ONLY)
    add_latex_document(
            SOURCE ${SOURCE_FILE}
            TARGET ${LECTURE_NAME}
            RCFILE ${PROJECT_SOURCE_DIR}/latexmkrc.cmake
    )
    set(OUTPUT_PDF ${CMAKE_CURRENT_BINARY_DIR}/${LECTURE_NAME}_source.pdf)
    add_custom_command(
            TARGET ${LECTURE_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy ${OUTPUT_PDF} ${BUILD_DIR}/${LECTURE_NAME}.pdf
            COMMENT "Copy ${OUTPUT_PDF} into ${BUILD_DIR}/${LECTURE_NAME}.pdf"
    )
endfunction()

add_subdirectory(lecture/c1)
add_subdirectory(lecture/c2)
add_subdirectory(lecture/c3)
add_subdirectory(lecture/c4)
add_subdirectory(lecture/c5)
add_subdirectory(lecture/appendix)

add_subdirectory(lecture/all)
