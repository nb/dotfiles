from __future__ import division
from __future__ import with_statement

import os
import re
import csv
import sys
import glob
import math
import time
import random
import string
import datetime
import operator
import itertools
from random import randint, choice

try:
	import readline
except ImportError:
	print("Module readline not available.")
else:
	import rlcompleter
	readline.parse_and_bind("tab: complete")
