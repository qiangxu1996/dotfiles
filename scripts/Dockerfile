ARG BASE=alpine:latest
ARG ROOT=1
FROM $BASE AS base

RUN apt-get update \
    && apt-get install -y --no-install-recommends zsh sudo \
    && rm -rf /var/lib/apt/lists/*

FROM base AS base1
RUN chsh -s /bin/zsh

FROM base AS base0
ARG USERNAME=user
ARG USER_UID=1000
ARG GROUPNAME=$USERNAME
ARG USER_GID=$USER_UID
RUN groupadd --force --gid $USER_GID $GROUPNAME \
    && useradd --uid $USER_UID --gid $USER_GID --create-home --shell /bin/zsh $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME

FROM base$NONROOT
ARG GITHUB_USERNAME=qiangxu1996
ENV TERM=xterm-256color
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME \
    && zsh -ils -c -- '@zinit-scheduler burst'
CMD ["/bin/zsh"]
