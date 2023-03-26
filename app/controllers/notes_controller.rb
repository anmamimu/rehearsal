# frozen_string_literal: true

class NotesController < ApplicationController
  skip_before_action :require_login, only: :create
  before_action :find_note, only: %i[show edit update destroy]
  before_action :set_q, only: %i[index search]

  def index
    @notes = @q.result.order(created_at: :desc).page(params[:page])
  end

  def show; end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to notes_path, success: t('defaults.message.created', item: '新規メモ')
    else
      flash.now[:danger] = t('defaults.message.not_created', item: '新規メモ')
      render :new
    end
  end

  def edit; end

  def update
    if @note.update!(note_params)
      redirect_to notes_path, success: t('defaults.message.updated', item: 'メモ')
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: 'メモ')
      render :edit
    end
  end

  def destroy
    @note.destroy!
    redirect_to notes_path, success: t('defaults.message.deleted', item: 'メモ')
  end

  def search
    @results = @q.result
  end

  def hashtag
    @user = current_user
    @hashtag = Hashtag.find_by(hashname: params[:name])
    @notes = @hashtag.notes
  end

  private

  def note_params
    params.require(:note).permit(:song_title, :singer_name, :audio, :hashbody, :content, hashtag_ids: [])
  end

  def find_note
    @note = current_user.notes.find(params[:id])
  end

  def set_q
    @q = current_user.notes.ransack(params[:q])
  end
end
