FROM ubuntu:18.04

ARG VERSION

##
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-1-add-bazel-distribution-uri-as-a-package-source
##
RUN apt-get update && apt-get install -y curl gnupg2 \
	&& curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
	&& echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list 

RUN apt-get update && apt-get install -y bazel-$VERSION
RUN apt-get update && apt full-upgrade -y

RUN ln -s /usr/bin/bazel-$VERSION /bazel

ENTRYPOINT /bazel

