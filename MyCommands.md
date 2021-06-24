# Build

docker build -t borg .

# Backup 
docker run --rm \
  -e BORG_PASSPHRASE=my-secret-pw \
  -e BORG_REPO=/borg/repo \
  -e BACKUP_DIRS=/borg/data \
  -e EXCLUDE='*/.cache*;*.tmp;/borg/data/etc/shadow' \
  -e COMPRESSION=lz4 \
  -e PRUNE=1 \
  -v config:/root/.config/borg \
  -v cache:/root/.cache/borg \
  -v repo:/borg/repo \
  -v data:/borg/data:ro \
  --security-opt label:disable \
  borg
 
# List (custom command)

docker run --rm \
  -e BORG_REPO=/borg/repo \
  -e BORG_PASSPHRASE=my-secret-pw \
  -e BORG_PARAMS='list' \
  -v repo:/borg/repo \
  -v config:/root/.config/borg \
  -v cache:/root/.cache/borg \
  --security-opt label:disable \
  borg

# Restore

docker run --rm \
  -e BORG_REPO=/borg/repo \
  -e BORG_PASSPHRASE=my-secret-pw \
  -e ARCHIVE=9f14e0a46473_2021-05-15 \
  -e EXTRACT_TO=/borg/restore \
  -v repo:/borg/repo \
  -v config:/root/.config/borg \
  -v cache:/root/.cache/borg \
  -v restore:/borg/restore \
  --security-opt label:disable \
  borg