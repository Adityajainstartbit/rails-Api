class Api::V1::ProductdetailsController < ApplicationController
  # before_action :authenticate_user!
  def index
    # @products = Product.all

    @q = Product.ransack(params[:q])
    if params[:create_date].present?
      date = Date.parse(params[:create_date])
      start_date = date.beginning_of_day
      end_date = date.end_of_day
      @q.created_at_gteq = start_date
      @q.created_at_lteq = end_date
     
    end
    if params[:category_name].present?
       @q.category_eq = params[:category_name]
    end

    @q.sorts = 'title asc' if params[:sort_title] == 'asc'
    @q.sorts = 'title desc' if params[:sort_title] == 'desc'
    @q.sorts = 'created_at asc' if params[:sort_created] == 'asc'
    @q.sorts = 'created_at desc' if params[:sort_created] == 'desc'


    @products = @q.result(distinct: true).order(created_at: :asc)

    @pagy, @paginated_products = pagy(@products, items: 10)
    @pagination = pagy_metadata(@pagy)

    render json: {
     status: "success",
      products: @paginated_products,
      pagination: @pagination



    }
  end
  def get_all_category
    category_name = Product.distinct.pluck(:category);

    render json: {categories: category_name}
  end

end
