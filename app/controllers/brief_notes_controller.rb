# frozen_string_literal: true

class BriefNotesController < ApplicationController
  before_action :find_brief_note, only: %i[edit update destroy]

  def index
    @brief_notes = current_user.brief_notes.all
  end

  def new
    @brief_note = BriefNote.new
  end

  def create
    @brief_note = current_user.brief_notes.new(brief_note_params)
    if @brief_note.save
      redirect_to brief_notes_path, success: t('defaults.message.created', item: '新規簡易メモ')
    else
      flash.now[:danger] = t('defaults.message.not_created', item: '新規簡易メモ')
      render :new
    end
  end

  def edit; end

  def update
    if @brief_note.update(brief_note_params)
      redirect_to brief_notes_path, success: t('defaults.message.updated', item: '簡易メモ')
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: '簡易メモ')
      render :edit
    end
  end

  def destroy
    @brief_note.destroy!
    redirect_to brief_notes_path, success: t('defaults.message.deleted', item: '簡易メモ')
  end

  private

  def brief_note_params
    params.require(:brief_note).permit(:title, :body)
  end

  def find_brief_note
    @brief_note = current_user.brief_notes.find(params[:id])
  end
end
