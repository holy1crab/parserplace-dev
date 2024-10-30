FROM node:21.6.2-bookworm

RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor | tee /etc/apt/trusted.gpg.d/google-linux.gpg > /dev/null \
        && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
        && apt-get update && apt-get install -y \
        build-essential \
        ninja-build \
        python3-pip \
        bc \
        pkg-config \
        zip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        glib-2.0-dev \
        libjpeg-dev \
        libgif-dev \
        libtiff-dev \
        liblcms2-dev \
        libexpat-dev \
        libpng-dev \
        libheif-dev \
        imagemagick \
        ffmpeg \
        libjpeg-turbo-progs \
        libfftw3-dev \
        libopenexr-dev \
        libgsf-1-dev \
        libglib2.0-dev \
        liborc-dev \
        libopenslide-dev \
        libmatio-dev \
        libwebp-dev \
        libexpat1-dev \
        libexif-dev \
        libtiff5-dev \
        libcfitsio-dev \
        libpoppler-glib-dev \
        librsvg2-dev \
        libpango1.0-dev \
        libopenjp2-7-dev \
        libimagequant-dev \
        wget \
        gnupg \
        && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei \
        fonts-thai-tlwg fonts-kacst fonts-freefont-ttf --no-install-recommends \
        && rm -rf /var/lib/apt/lists/* && pip3 install meson --break-system-packages
#RUN usermod -a -G www-data node
#RUN mkdir /app && chown -R node:node /app

WORKDIR /usr/local/src

ARG VIPS_VERSION=8.15.1

RUN wget https://github.com/libvips/libvips/releases/download/v${VIPS_VERSION}/vips-${VIPS_VERSION}.tar.xz \
	&& tar -xJf vips-${VIPS_VERSION}.tar.xz \
	&& cd vips-${VIPS_VERSION} \
  && meson build --libdir=lib --buildtype=release -Dintrospection=auto \
  && cd build \
  && meson compile \
  && meson test \
  && meson install \
  && ldconfig

RUN mkdir /home/node/.config && chown -R node:node /home/node/.config
ENV NODE_ENV=development
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH google-chrome-unstable
EXPOSE 3000
WORKDIR /app
USER node

CMD ["npm", "run", "start:dev"]
