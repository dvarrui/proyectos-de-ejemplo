#!/usr/bin/env python3
import logging

log_format = '[%(asctime)s] [%(levelname)s] - %(message)s'
logging.basicConfig(level=logging.DEBUG, format=log_format)
logger = logging.getLogger(__name__)


logger.info("Executando el logger...")
logger.debug("Apuntamos los fallos!")
