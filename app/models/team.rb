class Team < ActiveRecord::Base
	validates :home_team, presence: true, length: {maximum: 50}, if: :home_team_valid?
	validates :away_team, presence: true, length: {maximum: 50}, numericality: {equal_to: 2}, if: :two_away_teams_valid?
	validates :away_team, presence: true, length: {maximum: 50}, if: :home_team_valid?

	belongs_to :event_tickets

	def home_team_valid
		Proc.new{ |a| if a.away_team.count < 2 && a.performers.nil? && a.artists.nil?}
	end

	def two_away_teams_valid
		Proc.new{ |b| if b.home_team.nil? && b.performers.nil? && b.artists.nil?}
	end

end
