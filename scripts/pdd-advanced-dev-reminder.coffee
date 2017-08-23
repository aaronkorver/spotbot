# Description:
#   Cron job for Spotbot to post into a specific room at a specific time.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Alex Sneed Miller


TIMEZONE = "America/Chicago"
Q_AND_A_CHECK = '0 0 8 * * 6' # s,m,h,d(0-31),m(0-11),dow
TIMESHEET_REMINDER = '0 47 8 * * 5' # S=1,M=2,T=3,W=4,R=5,F=6,S=7
ROOM = "pd+d_connected_products"

cronJob = require('cron').CronJob

# Seconds: 0-59
# Minutes: 0-59
# Hours: 0-23
# Day of Month: 1-31
# Months: 0-11
# Day of Week: 0-6


module.exports = (robot) ->
  timesheet_reminder = new cronJob TIMESHEET_REMINDER,
    ->
      robot.messageRoom ROOM, "Reminder to fill out timesheet https://app2.clarizen.com/Clarizen/TeamSpace/Timesheet"
    null # happens when the job stops
    true # start true/false
    TIMEZONE

  q_and_a_check = new cronJob Q_AND_A_CHECK,
    ->
      robot.messageRoom ROOM, "Check Q&As for products (run https://git.target.com/AlexSneedMiller/scripts/blob/master/q_and_a_checker.py)...this should be more automated in the future"
    null # happens when the job stops
    true # start true/false
    TIMEZONE
