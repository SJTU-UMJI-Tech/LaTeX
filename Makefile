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
  cp ${LECTURE_DIR}/template.tex ${LECTURE_DIR}/$(1)/$(2).tex
	${LATEX} ${OPTIONS} ${LECTURE_DIR}/$(1)/$(2).tex > ${LECTURE_DIR}/$(1)/make.log
	cp ${LECTURE_DIR}/$(1)/$(2).pdf ${OUTPUT_DIR}/$(2).pdf
	# rm ${LECTURE_DIR}/$(1)/$(2).tex
endef

define make_lecture_all
	${LATEX} ${OPTIONS} ${LECTURE_DIR}/$(1)/$(2).tex > ${LECTURE_DIR}/$(1)/make.log
	cp ${LECTURE_DIR}/$(1)/$(2).pdf ${OUTPUT_DIR}/$(2).pdf
	# rm ${LECTURE_DIR}/$(1)/$(2).tex
endef

define clean_lecture
	${LATEX} ${CLEAN_OPTIONS} ${LECTURE_DIR}/$(1)/$(2).tex
endef

.PHONY: all

all: c1 c2 c3 c4 lecture_all

c1: init
	$(call make_lecture,c1,c1_hello_latex)

c2: init
	$(call make_lecture,c2,c2_text)

c3: init
	$(call make_lecture,c3,c3_maths)

c4: init
	$(call make_lecture,c4,c4_graphic_table)

# c5: init
	# $(call make_lecture,c5,c5_advanced_usage)

lecture_all: init
	$(call make_lecture_all,all,lecture_all)

init:
	[ -d "${OUTPUT_DIR}" ] || mkdir ${OUTPUT_DIR}

check:
	${LATEX} -v

clean:
	$(call clean_lecture,c1,c1_get_started)
	$(call clean_lecture,c2,c2_text)
	$(call clean_lecture,c3,c3_maths)
	$(call clean_lecture,c4,c4_graphic_table)
	$(call clean_lecture,all,lecture_all)
	# $(call clean_lecture,c5,c5_advanced_usage)
