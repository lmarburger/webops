class WelcomeController < ApplicationController
  def index
  end

  private

  helper_method :users, :incidents, :log_entry, :log_entry_content

  def users
    pagerduty.get('users').users
  end

  def incidents
    pagerduty.get('incidents', :status => 'triggered,acknowledged')
      .incidents
  end

  def log_entry(incident)
    pagerduty.get("incidents/#{incident.id}/log_entries",
                  :include => ['channel'])
      .log_entries
      .map(&:channel)
      .reverse
  end

  def log_entry_content(content)
    return unless content

    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
      .render(content)
      .html_safe
  end

  def pagerduty
    PagerDuty::Connection.new(Rails.application.config.x.pagerduty.account,
                              Rails.application.config.x.pagerduty.token)
  end
end
