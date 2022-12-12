defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    reduce({a1 * b2 + a2 * b1, b1 * b2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, {a2, b2}) do
    add(a, {a2 * -1, b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    reduce({a1 * a2, b1 * b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    reduce({a1 * b2, a2 * b1})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    reduce({Kernel.abs(a), Kernel.abs(b)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, dem}, n) when n >= 0 do
    reduce({Integer.pow(num, n), Integer.pow(dem, n)})
  end

  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, dem}, n) when n < 0 do
    abs_n = Kernel.abs(n)
    reduce({Integer.pow(dem, abs_n), Integer.pow(num, abs_n)})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) when a >= 0 do
    Integer.pow(x, a) |> then(fn a -> Float.pow(a / 1, 1 / b) end)
  end

  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) when a < 0 do
    (1 / Integer.pow(x, Kernel.abs(a))) |> then(fn a -> Float.pow(a, 1 / b) end)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, dem}) when dem < 0 do
    reduce({num * -1, dem * -1})
  end

  @spec reduce(a :: rational) :: rational
  def reduce({num, dem}) when dem > 0 and is_integer(num) and is_integer(dem) do
    Integer.gcd(num, dem) |> then(fn a -> {num / a, dem / a} end)
  end
end
