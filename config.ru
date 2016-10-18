require_relative 'config/environment'

use Rack::MethodOverride
use RestaurantController
use UserController
run ApplicationController
