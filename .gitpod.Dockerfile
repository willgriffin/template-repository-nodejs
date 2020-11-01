FROM gitpod/workspace-full

# More information: https://www.gitpod.io/docs/config-docker/
USER root

# Install Chisel
RUN curl https://i.jpillora.com/chisel! | bash

# Install terraform repository
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install Dropbear SSH server
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        dropbear tmux terraform awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

USER gitpod

RUN mkdir -p /home/gitpod/.ssh/

# give me access to your workspace, you probably want to replace this with your own key
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCRpm/zz2meXFybKr3uo4+DRoAMPHi8yZDDb4RBEIcFYHYHW0phCpjTh93kkypy0Gv9iMlhrc6kIg4ykNMl8jKSrmhnIw2GGTDPfygXFHI0gvQEnvcqYuuNINKoHPrUQsW6XIWPY89b2UEaBUxwGixn8DUNYdnOZYQa04SUn8LQqlk/+t/GbZIySWfpE5T0gIkt2Xu4j9GOYrvaZJhnPs2m5pKd9E9ERQJob0dDKX6ZThqSBQQs9t5lowBZ8GAwXQyPvLIQvDahwKOr1pCVd/aQrgV3EW6xs8cxHG+6E+eEbsopTxXoUosCvjwPhEUnobdTKSMJydY+c22jhTf6sgSysKgE4EvIpvBbQdjvgXQCJ+jzq1/9rIx1ETyl2/50xDI2YIE9FF8nafHGM4VrVBVx6sVkFvwAyF5z0pqdeaBQpOwsQT7XxRqk7c6/okwyVNcIyzuXe76alYqW8Oa3/UX0IP17uGaekPvsSteo7s7UxA76mdeAH1D0yl5I9audFnc= " >> /home/gitpod/.ssh/authorized_keys

