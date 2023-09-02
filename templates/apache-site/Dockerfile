FROM apache

ARG PROJECT_DOMAIN
ARG PROJECT_DIR
ARG PROJECT_PUBLIC_DIR
ARG PROJECT_ALIASES=""
ARG EXTRA_CMD=""
ARG APACHE_SITE_CONF=/etc/apache2/sites-available/project.conf
ARG APACHE_22=0

COPY ./conf/apache.conf ${APACHE_SITE_CONF}
COPY ./conf/apache22.conf /tmp/

RUN if [ $APACHE_22 -eq 1 ]; then \
		cp /tmp/apache22.conf ${APACHE_SITE_CONF}; \
	fi

RUN sed -i "s|PROJECT_DOMAIN|${PROJECT_DOMAIN}|g" ${APACHE_SITE_CONF}
RUN sed -i "s|PROJECT_DIR|${PROJECT_DIR}|g" ${APACHE_SITE_CONF}
RUN sed -i "s|PROJECT_PUBLIC_DIR|${PROJECT_PUBLIC_DIR}|g" ${APACHE_SITE_CONF}

RUN if [ -z "$PROJECT_ALIASES" ]; then \
			sed -i "s/ALIASES//" ${APACHE_SITE_CONF}; \
		else \
			sed -i "s/ALIASES/ServerAlias ${PROJECT_ALIASES}/" ${APACHE_SITE_CONF}; \
		fi

RUN if [ ! -z "$EXTRA_CMD" ]; then \
				${EXTRA_CMD}; \
		fi

RUN if [ $APACHE_22 -eq 1 ]; then \
		a2ensite project.conf; \
	else \
		a2ensite project; \
	fi

EXPOSE 80
