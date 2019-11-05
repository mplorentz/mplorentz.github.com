# Makefile
MICROBLOG_TEMPLATE := _templates/micro.md
POST_TEMPLATE := _templates/post.md
POST_TITLE := $(shell date +%Y-%m-%d-%H%M%S%z)
POST_TIME  := $(shell date +%Y-%m-%dT%H\:%M\:%S%z)
POST_FILE  := _posts/$(POST_TITLE).md
.PHONY: micro

micro:
	@cat $(MICROBLOG_TEMPLATE) | \
	sed "s/%CURRENT_DATE%/$(POST_TIME)/g" > ${POST_FILE} && \
	vim ${POST_FILE}

post:
	@cat $(POST_TEMPLATE) | \
	sed "s/%CURRENT_DATE%/$(POST_TIME)/g" > ${POST_FILE} && \
	vim ${POST_FILE}
