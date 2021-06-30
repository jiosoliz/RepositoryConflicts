Feature: Channel1 - Create channel

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
      | email2     | @templates.channels$.emailChannel          |
      | emailTLS3  | @templates.channels$.emailChannelWithTls   |
      | slack4     | @templates.channels$.slackChannel          |
      | webhook5   | @templates.channels$.webhookChannel        |
      | twilioWP6  | @templates.channels$.twilioChannelWhatsapp |
      | twilioSMS7 | @templates.channels$.twilioChannelSms      |
      | telegram8  | @templates.channels$.telegramChannel       |
      | jalatalk9  | @templates.channels$.jalatalkChannel       |
