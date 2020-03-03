FROM ubuntu:18.04

ARG VERSION

RUN apt update && apt install -y g++ unzip zip curl 
RUN curl -L https://github.com/bazelbuild/bazel/releases/download/$VERSION/bazel-$VERSION-installer-linux-x86_64.sh -o bazel-installer.sh && ls -la \
	&& chmod +x bazel-installer.sh \
	&& ./bazel-installer.sh


##
# https://docs.bazel.build/versions/master/install-ubuntu.html#step-1-add-bazel-distribution-uri-as-a-package-source
##
#RUN apt-get update && apt-get install -y curl gnupg2 \
#	&& curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
#	&& echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list 

#RUN apt-get update && apt-get install -y bazel-$VERSION
#RUN apt-get update && apt full-upgrade -y

ENTRYPOINT /usr/local/bin/bazel

