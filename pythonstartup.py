from __future__ import division
from __future__ import with_statement

import math
import os
import sys
import re
import time
import datetime
import random
from random import randint, choice
import operator
import itertools

try:
	import readline
except ImportError:
	print("Module readline not available.")
else:
	import rlcompleter
	readline.parse_and_bind("tab: complete")
