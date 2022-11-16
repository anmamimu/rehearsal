class NotesController < ApplicationController
  skip_before_action :require_login, only: :create
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @notes = @q.result
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to notes_path, success: t('defaults.message.created', item: '新規メモ')
    else
      flash.now[:danger] =  t('efaults.message.not_created', item: '新規メモ')
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

  private

  def note_params
    params.require(:note).permit(:song_title, :singer_name, :content)
  end

  def find_note
    @note = current_user.notes.find(params[:id])
  end

  def set_q
    @q = Note.ransack(params[:q])
  end

end