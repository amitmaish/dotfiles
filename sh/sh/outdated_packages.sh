#!/bin/bash

brew outdated 2>/dev/null | wc -l | tr -d " "
