Feature: Channel - Create channel

  @functionality @smoke
  Scenario Outline: Verify that it is possible create <type> channel
    Given I set a "POST" request to "/channels"
    And I set the "<channel_template>" template
    When I send the request
    Then I expect the status code is equals than "200"
    And I save the response as "channel_post"
    And I expect the response "$.channel_post.name" contains "<type>" value
    Examples:
      | type      | channel_template                           |
      | email     | @templates.channels$.emailChannel          |
      | emailTLS  | @templates.channels$.emailChannelWithTls   |
      | slack     | @templates.channels$.slackChannel          |
      | webhook   | @templates.channels$.webhookChannel        |
      | twilioWP  | @templates.channels$.twilioChannelWhatsapp |
      | twilioSMS | @templates.channels$.twilioChannelSms      |
      | telegram  | @templates.channels$.telegramChannel       |
      | jalatalk  | @templates.channels$.jalatalkChannel       |
