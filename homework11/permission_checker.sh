#!/bin/bash
cd /opt/101025-ptm/ 
ls -la *.sh | awk '{print $1, $9}'
find . -maxdepth 1 -name '*.sh' -type f -exec chmod +x {} +