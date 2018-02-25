PWD           = $(shell pwd)
LECTURE_DIR   = ${PWD}/lecture
OUTPUT_DIR    = ${PWD}/build
LATEX         = latexmk
LATEX_VERSION = $(shell ${LATEX} --version | grep -oe '[0-9]\.[0-9]' | sed 's/\.//g')
LATEX_FLAG    = $(shell [ '${LATEX_VERSION}' -ge '45' ] && echo 1 || echo 0)
ifeq (0, ${LATEX_FLAG})
	LATEX := ${PWD}/third_party/latexmk
endif
OPTIONS       = -xelatex -cd -shell-escape -synctex=1 -halt-on-error -deps -time -quiet
CLEAN_OPTIONS = -C -cd

define make_lecture
	${LATEX} ${OPTIONS} ${LECTURE_DIR}/$(1)/$(2).tex > ${LECTURE_DIR}/$(1)/make.log
	cp ${LECTURE_DIR}/$(1)/$(2).pdf ${OUTPUT_DIR}/$(2).pdf
endef

define clean_lecture
	${LATEX} ${CLEAN_OPTIONS} -C ${LECTURE_DIR}/$(1)/$(2).tex
endef

separate: c1 c2 c3 c4 c5

c1: init
	$(call make_lecture,c1,c1_get_started)

c2: init
	$(call make_lecture,c2,c2_text)

c3: init
	$(call make_lecture,c3,c3_maths)

c4: init
	$(call make_lecture,c4,c4_graphic_table)

c5: init
	$(call make_lecture,c5,c5_advanced_usage)

all: init
	$(call make_lecture,all,lecture_all)

init:
	[ -d "${OUTPUT_DIR}" ] || mkdir ${OUTPUT_DIR}

check:
	${LATEX} -v

clean:
	$(call clean_lecture,c1,c1_get_started)
	$(call clean_lecture,c2,c2_text)
	$(call clean_lecture,c3,c3_maths)
	$(call clean_lecture,c4,c4_graphic_table)
	$(call clean_lecture,c5,c5_advanced_usage)
