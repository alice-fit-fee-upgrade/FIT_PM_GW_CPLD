# Optional isolated user space. Vendor ISE binaries are mounted, never copied.
# A working ISE mount and its license must be provided by the user.
# This image has not been runtime-tested with ISE in this workspace.
FROM debian:12-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash libstdc++6 libncurses5 libtinfo5 libx11-6 libxext6 libxi6 libxtst6 \
    libfreetype6 libfontconfig1 python3 make git ca-certificates \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /work
ENV ISE_SETTINGS=/opt/ise/settings64.sh
ENTRYPOINT ["bash"]
