class QuestionsController < ApplicationController

  before_action :set_user, only: :index
  # before_action :set_user, only: [:index, :xxx, :xxx]
  before_action :set_questions, only: :index

  def new
  end

  def index
  end

end
