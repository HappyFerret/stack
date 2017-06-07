#!/bin/bash -ex

set -e
cat <<EOF > foo
Host *
  IdentityFile ~/.ssh/key.pem
  User ubuntu
EOF
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZ7ssb7qaw7gsG/r2y1A3lI7jJobkURJOQGpsDSITNk/qBKeOMqhs1NIJ6FXXCSFt+FFq7i+yM+gS8DKMLSQP26vkHDOP67Ty7yOfFs+3vABk6KfmGnPNUO7A+s9OK2EJvLzBomeamL2QXyH0y4srjYxRkcmPOmH9qdG3i01thG0YqyQN//s+qIIoWRMtmeoxv6h4L4QIifz/wqk61+N4taAy3lGZWyDC+nPT/zE3v94r1VLI4rPG/EfMmExv5sPTHjCsBPniuJOlzkHIKF4cVB6W/AGcqNrhwFkJICmXuylQ+aNPkb+TtGfn6eGovWQXFeyIDySrC7A2uxAQnY6kv0a/kMZOC1CokQBFX2fw5k1PJHFt5FF+FZ6BK5K0ZCNxWdlwKmkxr5xr80z4xJ9r7RpmRFOdtA26MCrmj6VwxBv9GLDuWlyO5zFYbx0K2Q83V2b3x9cGKrdkH4HpPRbHL4Rnst67mq2w+T7qsqM0k6h+724zHOs8bTZO1U8flbxNGhgIlyzwh5jt5BYdbewf93u5TxFzCMrPrTeeU84gCmZc2qzIdSMzpcoRfC7rHq/MkCHsM+FZ1dMlENZCyNgSk4B+zriy/JGU6IyHmS80VrhPyBRndsRXw2+Ug5NG9ifW3/EfUGmvcqZ5WzYDdYkHFSfIfgvW/rsnl7UnE4f1mcw== luke@lukebarton.co.uk" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCl0NcLiExdHXtzyHCBy+uemvMHjhTqPW1aQXIPySdYbDBEI/kLyiZohja+VFILwEleR4zo6OIIEK+aUJOTCNPQIbrsD1+rfb0dDCbZlVE8AAJ0mpgNQB1pE/Cb75hKG9EXJv/ZY55birGCJqX9gmOBMeT8V1LZB1YNCG9DDjq+Mbd326/dgogKM7b3YB7SbW1C0rhOVVrVCmBkvBcLUF1xhsPm3QqxwnJYasR7mI9ONbLbxIZc5B6+JLidX1vvWqkEHC5yIbHitNLZxjpBuAnhFFE4O4CJyUV3G6LJiMvZmJM28mtUtOKkjoDYD68sHo0FnYTxHscfmfh+sGtjOV3f toby.summerfield@c324086.local" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDQIohZKpHuxEsL1Kgbp+BraCnkSocq19u47uybjTCFZWedXEN+piuAvlCFRdYviWTXYJ43FfNPFCQJIDsjVC76tukSsDtSyAaTsq7VJNRPWjd1Yyd9V4rC9rpvGzlGfCNk7gE7ZLfEdDgLxNEf/VuEQ7y1rWDmovpPjC/hUn30A9oMmxuvwJeBQA9DFdTN55Rv4JblRXBHEgk3i6qxQLQ9z5uC4K+ckMZ8x31q7lOcWsWGqWJkun9fA/3TDB1DmeIyqANehqvjrfw0xXWampWiGi+V3kHmknQBBi7BfHpmeA+4/PcpMj8UFMAemnn0ZTtu2VMcsS2FQmjZbYOYRx6jU3vL5KfIJ5vXNZUKAS9wIDDOU46C8g2vk1gUQFR8KqypzeVg/+3Hwpt5fCeQjdPDk9iGNs0wIur5oJhyrHZW0NSwRJjjgI8+7ZdxCXDyy/irCmBqav0YrWpRXvLYDlF1M1rphGweME3dzWFvyqFsI8b/gLqOr3pxYPFuOm3B5ZByDZcdUrelQ+ByYnvLvU5ZUruHuNN6YQ5l1uqmmYEiPgTLfMtqcwGdXYgOgk+QQrne+3Mq2kWMMIdgnhgkrRg4fT8qy4iRkgETEP3u78X919p+M3dqkm9d8JYnIaxHKR4frZ5gH9lbLsvYbl/srzXzr1mSuxr12laT7hE3HfiNxw==" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCYZEwX9mXrFdbCMRtdB6gaw15bfsEt8SBi9RG6MO1lyQETN0LCX6+Q+iWJGO27lmTfiLiCeTYFMOY0WOCbwpA64TEg4QD8x7COtzbsA4+nA304brrTJSMc16t3bz5TfsDl5glDrLlG55cGJooXH4om/S+okpfhjjjFNr4dMDBQr78td1orJitHh565EwmRKtck2qr/Z7FAjQImJhK/RVN/6lzmiDgrZNNESQ9VMw/WaRyqzyAertVlJq6rcDQgfc2WcXa4pQYLuAGmNQXjkTtG03JPWibAScB41e8SkhU0FmgktdY3SgOEKU56hinD1H0OeuK5f+ZA+zH3Z/pRNQa9j52Baj8+ScscT/D2GD2VNvqa5GZ9u8ypcx5UDHzmddsumImOXWTNwLBoTBm5tiCCyGw8z0Tpdh5wYQRn3o75XSrTNH2wKxE+JQUcC4AkyH0xZU9RJHYKqQrwiv/UuVqTbAnE4ma3897AXTmd0PRhJhURFiIMunzLIL4q0J+DbUrw5XEqhAA/LwQ4etgbMqW3HoL0JfZArxJuktlpEYJDw3IeCs44TIgfY+dXuTL4ui7GlH73qf2Kb9e7FO0+nJWkdxkhM0NHxw6F5S/y3wWcl+c9D8nVV57DDk8hGPaJYW1z7gYsZ1CpqAHADELBi3/Iu9ILp1HYfS2iW+uJpu0d7Q== yannvr@gmail.com" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC52nOUMCb+efswrSo3OAs0anFDF+8vjjZ1zKodztGH1IWx6ScHOYCMT+R1d8UXpKVhTt/djl4LQniKohjSJsMI5/sLPBDdF725LXRDX5bae+rrRMwNoWivroLBGDPp1LaCoELzOmzRarUOcUr+VWOciQ13a2ZS/KTgf6wMQiPxoPMNA5PA8zu1tikX4Ab3CEN4krgi8UoMDry0ACA1Tt/iVBW5tLr4sqO+/g2lV+eCpVCLu8aiNwHmiLLxog9Ff8WqI5ziCt5aQWxeXT2mP5WK/PVYpWDrxAir7lq+7ULWbbe4b5nNlZurfvjOfCzoXTEd+JmvQKq6k4Ni+brLNfYz5N6OoU0n71AS5v6FRBqlKC0i4qbUTvFPDdizHpawRPen6eC9J4p5602Tz1yBbE94su1ZYk3u6VFQfUe2fooMSQvwL6aXeN3xpZEEp3QKM9Kvm7akBb7hdPced3UkLfLhqttxXXse6cbnB0jHQlzgk8105foi/ULvdCPDum9pH9eDoOK+jeIiXhG9yvJRBRfEwhcC63y4TJRfNOMcSeYHlarQVAizPSYPRghaf0NoetK0OqDy8MWWHiq+/3wqybMfdcKrLDKZUjQM5AK2ir9uQKP4xasRMrPq7Cq0Rqc/I0+Pz0Yia9hMXAU2uaulxILbrPR897B3dSOyVJ3Cpkc6IQ== mbp" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDnAPgTGgWzgvNLZH21ny3qp3lHOMrB6FQPWaP2tz1aQ1nSnri6aMo7bZf5ABL9hSizo0y2AzmKGHoh5erYVycfZQ20kR0E7MMXgl3pfj047WyuxfyaV434xZ+oEuuQrhSgXZMuMUn5PqjoNNFCn/J3HMgjk6WQCpHGdA+hBdNpskXpYRDGTX6uPhrPiQNcdg0WBY2BWiGXXDBapRCeXHPWNoKNRlc++S3U9V3W+93DwCHMCnoQmQSk6yxEZsbUHJvJO2rEoQhUaQrxOZFp8SmjPzVlIBimo5yE5PSnBvJdTALBRqAxIvIQBRVVIqowCbwdrYy/ujW7f3GuT/9QTqCgpl5y2joaCW585+1VJdWDjvET9SjuFv5L12AWCYFm3onZx+9XhtWlGypaBzxprY9dO0TzcDrD91jXpMoNvWT2PUg2RiS5MOE9r/Vg9Ece4G/QuRnIumCCu0XuloGSfJ8kcKJlkjWffb3Si5/hC8n7kPeoVjX8fuIJbrGDdgBJ1KCp8IDGY5xl6/9RJaPqtkqpHGbwszYg8jv6sHODpzl7vYpFo/f7V44/tgrNrwUTDrXU9KnmA0c3yZYN6MQvLRslgMI/kq3VH0/K6kdcV5L5C0YqnFWLRI0aCGMcugWmk6nb7QU652eFYRvcZYxyIlAWyN4wccZkTm8CsCRmRTtYcw== rich.jeffrey@mylocalheroes.com" >> ~/.ssh/authorized_keys
