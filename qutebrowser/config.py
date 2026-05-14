from themes import city_lights

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
config: ConfigAPI = config  # noqa: F821  # ty:ignore[unresolved-reference]
c: ConfigContainer = c # noqa: F821  # ty:ignore[unresolved-reference]

config.load_autoconfig(True)

c.backend = 'webengine'
c.content.javascript.enabled = True

city_lights.setup(config)

config.bind('<z><l>', 'spawn --userscript qute-pass --d dmenu')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --d dmenu --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --d dmenu --password-only')
config.bind('<z><f>', 'spawn --userscript qute-pass --d dmenu --unfiltered')
