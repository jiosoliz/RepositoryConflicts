Feature: Channel2 - Create channel

  @functionality @smoke @functional
  Scenario Outline: Verify that it is possible create <type> channel2
    Given I set a "PUT" request to "/channels"
    And I set the "<channel_template>" template
    When I send the request
    Then I expect the status code is equals than "200"
    And I save the response as "channel_post"
    And I expect the response "$.channel_post.name" contains "<type>" value
    Examples:
      | type      | channel_template                           |
      | email13     | @templates.channels$.emailChannel          |
      | emailTLS23  | @templates.channels$.emailChannelWithTls   |
      | slack33     | @templates.channels$.slackChannel          |
      | webhook43   | @templates.channels$.webhookChannel        |
      | twilioWP53  | @templates.channels$.twilioChannelWhatsapp |
      | twilioSMS63 | @templates.channels$.twilioChannelSms      |
      | telegram73  | @templates.channels$.telegramChannel       |
      | jalatalk83  | @templates.channels$.jalatalkChannel       |
